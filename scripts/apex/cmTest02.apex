        Decimal total = 0;
    
        for(Account acc : [SELECT AnnualRevenue FROM Account WHERE AnnualRevenue > 100000000]){
            total += acc.AnnualRevenue;
        }
        
        System.Debug('Totalxx = ' + total);
