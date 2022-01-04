public class CampaignMemberCloner {
    
    @InvocableMethod(label='Clone Campaign Members')
    public static list<String> cloneCampaignMembersBatch(List<CampaignMemberClonerRequest> requests){
        List<String> statusMessages = new List<String>();
        
        //STEP THROUGH THE LIST OF REQUESTS, CALLING cloneCampaignMembers(request)
        //RETURNING STATUS MESSAGE
        for(CampaignMemberClonerRequest request : requests){
            statusMessages.add(cloneCampaignMembers(request));
        }
        return statusMessages;
    }
    
    private static String cloneCampaignMembers(CampaignMemberClonerRequest request){
        String statusMessage = '';
        //BUILD THE DYNAMIC QUERY
        String countQuery = 'SELECT Count() FROM CampaignMember WHERE CampaignId = \'';
        countQuery += request.sourceCampaign.Id + '\' ';
        String memberQuery = 'SELECT Id, CampaignId, ContactId, LeadId, Status ';
        memberQuery += 'FROM CampaignMember WHERE CampaignId = \'';
        memberQuery += request.sourceCampaign.Id + '\' ';
        if(request.statusFilter != 'All'){
            countQuery += 'AND Status = \'' + request.statusFilter + '\' '; 
            memberQuery += 'AND Status = \'' + request.statusFilter + '\' '; 
        }
        
        //CHECK TO MAKE SURE THERE ARE FEWER THAN 10K CAMPAIGNMEMBERS IN SOURCE CAMPAIGN
        //AND THE SOURCE CAMPAIGN != THE TARGET CAMPAIGN
        Integer sourceCmCount = Database.countQuery(countQuery);
        String errorMessage = '';
        errorMessage = 'The source campaign ' + request.sourceCampaign.Name;
        errorMessage += ' has ' + sourceCmCount + ' campaign members, ';
        errorMessage += 'which exceeds the limit of 10,000 for this clone operation.';
        if(sourceCmCount > 10000){
            return errorMessage;
        }else if(request.sourceCampaign.Id == request.targetCampaign.Id){
            statusMessage = 'Sorry, you cannot clone members from the target campaign. ';
            statusMessage += 'Select a different Source Campaign.';
            return statusMessage;
        }else{
            List<CampaignMember> targetCmList = new List<CampaignMember>();
            
            //GET THE MEMBERS FROM THE SOURCE CAMPAIGN (USING THE DYNAMIC SOQL QUERY)
            for(CampaignMember sourceCm : Database.query(memberQuery)){
                
                //BUILD A LIST OF CAMPAIGNMEMBERS FOR OUR TARGET CAMPAIGN
                CampaignMember newCm = new CampaignMember();
                newCm.CampaignId = request.targetCampaign.Id;
                newCm.ContactId = (sourceCm.ContactId != null) ? sourceCm.ContactId : null;
                newCm.LeadId = (sourceCm.LeadId != null) ? sourceCm.LeadId : null;
                if(request.memberStatus == 'Copy Source'){
                    newCm.Status = sourceCm.Status;
                }else{
                    newCm.Status = request.memberStatus;
                }
                targetCmList.add(newCm);
            }
            //INSERT THE LIST OF CAMPAIGNMEMBERS FOR OUR TARGET CAMPAIGN
            try{
                insert targetCmList;
            }   catch(dmlException e){
                return 'Error saving CampaignMembers: ' + e.getDmlMessage(0);
            }
            
            //RETURN A STATUS MESSAGE
            statusMessage = 'Created ' + targetCmList.size() + ' CampaignMembers on ';
            statusMessage += request.targetCampaign.Name + ' cloned from '; 
            statusMessage += request.sourceCampaign.Name + '.';
            return statusMessage; 
        }
    }
}