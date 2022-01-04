@isTest
private class CampaignMemberClonerTest {
    @testSetup private static void setup(){
        //create an account
        Account acc = new Account();
        acc.Name = 'Acme';
        insert acc;
        System.debug('acc inserted');
        
        //create target and source campaigns
        Campaign target = new Campaign();
        target.Name = 'targetCampaign';
        target.Status = 'Planned';
        target.StartDate = Date.today() + 7;
        target.IsActive = true;
        insert target;
        
        Campaign source = new Campaign();
        source.Name = 'sourceCampaign';
        source.Status = 'Planned';
        source.StartDate = Date.today() + 2;
        source.IsActive = true;
        insert source;
        
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0; i<10; i++){
            Contact c = new Contact();
            c.LastName = 'testContact' + i;
            c.FirstName = 'contact';
            c.AccountId = acc.Id;
            contacts.add(c);
        } 
        insert contacts;
        
        List<Lead> leads = new List<Lead>();
        for(Integer i=0; i<10; i++){
            Lead ld = new Lead();
            ld.LastName = 'testLead' + i;
            ld.FirstName = 'lead';
            ld.Company = 'testCompany' + i;
            leads.add(ld);
        }
        insert leads;
        
        List<CampaignMember> cmList = new List<CampaignMember>();
        for(Integer i=0; i<10; i++){
            CampaignMember cm = new CampaignMember();
            cm.CampaignId = source.Id;
            cm.ContactId = contacts[i].Id;
            cmList.add(cm);
            CampaignMember lm = new CampaignMember();
            lm.CampaignId = source.Id;
            lm.LeadId = leads[i].Id;
            cmList.add(lm);
        }
        insert cmList;
    }
    
    @isTest
    private static void test_cloneCampaignMembersBatch1(){
        List<CampaignMemberClonerRequest> requests = new List<CampaignMemberClonerRequest>();
        Campaign targetCampaign = [SELECT Id, Name FROM Campaign WHERE Name = 'targetCampaign'];
        Campaign sourceCampaign = [SELECT Id, Name FROM Campaign WHERE Name = 'sourceCampaign'];
        CampaignMemberClonerRequest req = new CampaignMemberClonerRequest();
        req.statusFilter = 'All';
        req.memberStatus = 'Sent';
        req.targetCampaign = targetCampaign;
        req.sourceCampaign = sourceCampaign;
        requests.add(req);
        System.assertEquals('Created 20 CampaignMembers on targetCampaign cloned from sourceCampaign.', CampaignMemberCloner.cloneCampaignMembersBatch(requests)[0]);
    }
    
    @isTest
    private static void test_cloneCampaignMembersBatch2(){
        List<CampaignMemberClonerRequest> requests = new List<CampaignMemberClonerRequest>();
        Campaign targetCampaign = [SELECT Id, Name FROM Campaign WHERE Name = 'targetCampaign'];
        Campaign sourceCampaign = [SELECT Id, Name FROM Campaign WHERE Name = 'sourceCampaign'];
        CampaignMemberClonerRequest req = new CampaignMemberClonerRequest();
        req.statusFilter = 'Sent';
        req.memberStatus = 'Copy Source';
        req.targetCampaign = targetCampaign;
        req.sourceCampaign = sourceCampaign;
        requests.add(req);
        System.assertEquals('Created 20 CampaignMembers on targetCampaign cloned from sourceCampaign.', CampaignMemberCloner.cloneCampaignMembersBatch(requests)[0]);
    }
    
    @isTest
    private static void test_cloneCampaignMembersBatch3(){
        List<CampaignMemberClonerRequest> requests = new List<CampaignMemberClonerRequest>();
        Campaign targetCampaign = [SELECT Id, Name FROM Campaign WHERE Name = 'targetCampaign'];
        CampaignMemberClonerRequest req = new CampaignMemberClonerRequest();
        req.statusFilter = 'Responded';
        req.memberStatus = 'Responded';
        req.targetCampaign = targetCampaign;
        req.sourceCampaign = targetCampaign;
        requests.add(req);
        System.assertEquals('Sorry, you cannot clone members from the target campaign. Select a different Source Campaign.', CampaignMemberCloner.cloneCampaignMembersBatch(requests)[0]);
    }
}