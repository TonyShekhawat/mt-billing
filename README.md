# mt-billing
Simple billing input menu for QBCore

# Preview: 
- Video: 

https://user-images.githubusercontent.com/89866234/172459680-7674b590-2c70-44e2-b8a2-40661241039e.mp4

# Instalation:
Add to qb-radialmenu/config.lua:
```
            {
                id = 'billing',
                title = 'Faturar Player',
                icon = 'dollar-sign',
                type = 'client',
                event = 'mt-billing:client:AbrirMenu',
                shouldClose = true
            },
            
```

# Dependicies
- qb-input: https://github.com/qbcore-framework/qb-input
- qb-phone: https://github.com/qbcore-framework/qb-phone
- qb-radialmenu: https://github.com/qbcore-framework/qb-radialmenu (opcional)
