public with sharing class OpportunityPromptBuilder {

    public static String build(Opportunity opp) {

        return
            'You are an experienced Salesforce Sales Coach.\n\n' +

            'Analyze the following opportunity and provide:\n' +

            '1. Executive Summary\n' +
            '2. Risks\n' +
            '3. Recommended Next Actions\n' +
            '4. Probability of Closing\n\n' +

            'Opportunity Details:\n' +

            'Name: ' + opp.Name + '\n' +

            'Stage: ' + opp.StageName + '\n' +

            'Amount: ' + opp.Amount + '\n' +

            'Account: ' + opp.Account.Name + '\n' +

            'Description: ' + opp.Description;

    }

}