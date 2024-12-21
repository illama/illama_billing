local DB = {}

-- Récupérer toutes les factures d'un joueur
function DB.GetPlayerBills(identifier, cb)
    MySQL.query('SELECT * FROM illama_bills WHERE receiver = ? AND status = ? ORDER BY date DESC', 
        {identifier, 'pending'},
        function(bills)
            cb(bills or {})
        end
    )
end

-- Créer une nouvelle facture
function DB.CreateBill(data, cb)
    MySQL.insert('INSERT INTO illama_bills (sender, sender_name, receiver, receiver_name, amount, reason, type, society) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        {
            data.sender,
            data.sender_name,
            data.receiver,
            data.receiver_name,
            data.amount,
            data.reason,
            data.type,
            data.society
        },
        function(id)
            if cb then cb(id) end
        end
    )
end

-- Récupérer une facture par ID
function DB.GetBillById(billId, cb)
    MySQL.single('SELECT * FROM illama_bills WHERE id = ? AND status = ?', 
        {billId, 'pending'},
        function(bill)
            if cb then cb(bill) end
        end
    )
end

-- Marquer une facture comme payée
function DB.SetBillPaid(billId, cb)
    MySQL.update('UPDATE illama_bills SET status = ? WHERE id = ?', 
        {'paid', billId},
        function(affectedRows)
            if cb then cb(affectedRows > 0) end
        end
    )
end

-- Ajouter de l'argent au compte bancaire d'un joueur hors-ligne
function DB.AddOfflinePlayerMoney(identifier, amount, cb)
    MySQL.update('UPDATE users SET accounts = JSON_SET(accounts, "$.bank", CAST(JSON_EXTRACT(accounts, "$.bank") AS UNSIGNED) + ?) WHERE identifier = ?',
        {amount, identifier},
        function(affectedRows)
            if cb then cb(affectedRows > 0) end
        end
    )
end

-- Récupérer l'historique des factures d'un joueur
function DB.GetBillsHistory(identifier, limit, cb)
    limit = limit or 50 -- Par défaut, limite à 50 factures
    MySQL.query('SELECT * FROM illama_bills WHERE receiver = ? OR sender = ? ORDER BY date DESC LIMIT ?', 
        {identifier, identifier, limit},
        function(bills)
            cb(bills or {})
        end
    )
end

-- Supprimer les vieilles factures (optionnel, pour le nettoyage)
function DB.CleanOldBills(daysOld, cb)
    local timestamp = os.time() - (daysOld * 24 * 60 * 60)
    MySQL.query('DELETE FROM illama_bills WHERE date < FROM_UNIXTIME(?) AND status = ?', 
        {timestamp, 'paid'},
        function(affectedRows)
            if cb then cb(affectedRows) end
        end
    )
end

return DB