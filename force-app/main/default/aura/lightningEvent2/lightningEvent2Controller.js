({
	doInit : function(component, event, helper) {
		component.set("v.myColumns",[
             {label: 'sno', fieldName:'sno', type:'number'},
             {label: 'Name Of Source', fieldName:'source', type:'text'},
             {label: 'Amount',fieldName:'amount',type:'number'}          
        ]);
        component.set('v.incomes',[
            {
            sno:1,
            source: 'Job Income',
            amount:10000},
             {
               sno:2,
            source: 'Job Income1',
            amount:20000}                     
            
        ]);
	},
    handleRegisteredCopmponentEvent :function(component, event, helper) {
        alert('event handler in source component that fired teh event ');
    },
    
    toggleIncomeForm: function(component, event, helper)
    {
        var incomeForm = component.find('IncomeForm');
        $A.util.toggleClass(incomeForm,'hide');
    },
    
    addIncome: function(component, event, helper){
      var incomes = component.get('v.incomes');
        var newIncome = {
            sno: incomes.length + 1,
            source :component.find('source').get('v.value'),
            amount: parseFloat(component.find('amount').get('v.value'))
        }
        if(newIncome.source!= '' && newIncome.amount!='')
        {
           incomes.push(newIncome); 
            component.set('v.incomes',incomes);
            component.find('source').set('v.value','');
            component.find('amount').set('v.value','');
        }
        
    },
    fireTotalIncomeComponentEvent:function(component, event, helper)
    {
        var incomes = component.get('v.incomes');
        var totalIncome = 0;
        for(var i=0;i<incomes.length;i++){
            totalIncome += incomes[i].amount;
        }
        var totalIncomeComponentEvent =component.getEvent('totalIncomeComponentEvent');
        totalIncomeComponentEvent.setParams({
            totalIncome:totalIncome
        });
        totalIncomeComponentEvent.fire();
    }
})