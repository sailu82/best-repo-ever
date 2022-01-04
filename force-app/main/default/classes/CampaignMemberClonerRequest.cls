public class CampaignMemberClonerRequest {

    @InvocableVariable(label='Members to Include' required=true)
    public String statusFilter;

    @InvocableVariable(label='Set New Member Status' required=true)
    public String memberStatus;

    @InvocableVariable(label='Source Campaign' required=true)
    public Campaign sourceCampaign;

    @InvocableVariable(label='Target Campaign' required=true)
    public Campaign targetCampaign;

}