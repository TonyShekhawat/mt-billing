local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mt-billing:client:AbrirMenu', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = "Bill",
        submitText = "Bill Player",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'paypal id'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = '$ amount!'
            }
        }
    })
    if dialog then
        if not dialog.id or not dialog.amount then 
            return 
        end
        TriggerServerEvent("mt-billing:server:PassarFatura", dialog.id, dialog.amount)
    end
end)

RegisterCommand('bill', function()
    TriggerEvent('mt-billing:client:AbrirMenu')
end)