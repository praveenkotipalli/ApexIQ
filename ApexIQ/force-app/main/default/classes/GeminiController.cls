public with sharing class GeminiController {

    @AuraEnabled
    public static String askAI(String prompt) {
        return GeminiService.askGemini(prompt);
    }

}