local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("mt-billing:server:PassarFatura", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if billed ~= nil then
        if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
            if amount and amount > 0 then
                MySQL.Async.execute('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (@citizenid, @amount, @society, @sender, @sendercitizenid)', {
                    ['@citizenid'] = billed.PlayerData.citizenid,
                    ['@amount'] = amount,
                    ['@society'] = biller.PlayerData.job.name,
                    ['@sender'] = biller.PlayerData.charinfo.firstname,
                    ['@sendercitizenid'] = biller.PlayerData.citizenid
                })
                TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
            else
                TriggerClientEvent('QBCore:Notify', source, 'Must be a number above 0', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'You can not bill yourself...', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'The player is not online', 'error')
    end
end)