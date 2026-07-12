public with sharing class GeminiController {

    @AuraEnabled
    public static AIResponse askAI(String prompt) {
        return GeminiService.askGemini(prompt);
    }

    @AuraEnabled
public static AIResponse analyzeOpportunity(Id opportunityId) {

    Opportunity opp = [
        SELECT
            Name,
            StageName,
            Amount,
            Description,
            Account.Name
        FROM Opportunity
        WHERE Id = :opportunityId
        LIMIT 1
    ];

    String prompt = OpportunityPromptBuilder.build(opp);

    return GeminiService.askGemini(prompt);
}

}