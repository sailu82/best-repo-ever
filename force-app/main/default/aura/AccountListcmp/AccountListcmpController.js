({
   
    init: function ( cmp, event, helper ) {
       
        var actions = [
            { label: 'Edit', name: 'edit' },
            { label: 'View', name: 'view' } ];

        cmp.set( 'v.mycolumns', [
            { label: 'Name', fieldName: 'Name', type: 'text' },
            { label: 'Industry', fieldName: 'Industry', type: 'text' },
            { label: 'Type State', fieldName: 'Type', type: 'text' },
            { type: 'action', typeAttributes: { rowActions: actions } } ] );

        var action = cmp.get( "c.fetchAccts" );
        action.setParams({
        });
        action.setCallback(this, function( response ) {
            var state = response.getState();
            if ( state === "SUCCESS" ) {
                cmp.set( "v.acctList", response.getReturnValue() );
            }
        });
        $A.enqueueAction( action );
       
    },

    handleRowAction: function ( cmp, event, helper ) {
       
        var action = event.getParam( 'action' );
        var row = event.getParam( 'row' );
        var recId = row.Id;

        switch ( action.name ) {
            case 'edit':
                var editRecordEvent = $A.get("e.force:editRecord");
                editRecordEvent.setParams({
                    "recordId": recId
                });
                editRecordEvent.fire();
                break;
            case 'view':
                var viewRecordEvent = $A.get("e.force:navigateToURL");
                viewRecordEvent.setParams({
                    "url": "/" + recId
                });
                viewRecordEvent.fire();
                break;
        }
    }
   
})