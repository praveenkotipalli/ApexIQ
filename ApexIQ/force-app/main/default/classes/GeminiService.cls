public with sharing class GeminiService {

    public static String askGemini(String prompt) {

        Http http = new Http();
        HttpRequest req = new HttpRequest();

        String apiKey = 'AQ.Ab8RN6KacyYpELGnhFWCrRuvYpSJ-uIhZUXwIX3enoUmHtx1nw';

        req.setEndpoint(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key='
            + apiKey
        );

        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');

        String body =
        '{' +
        '"contents":[{' +
        '"parts":[{"text":"' +
        String.escapeSingleQuotes(prompt) +
        '"}]' +
        '}]' +
        '}';

        req.setBody(body);

        HttpResponse res = http.send(req);

        return res.getBody();
    }

}