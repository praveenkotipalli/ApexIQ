public with sharing class GeminiController {

    @AuraEnabled
    public static AIResponse askAI(String prompt) {
        return GeminiService.askGemini(prompt);
    }

}