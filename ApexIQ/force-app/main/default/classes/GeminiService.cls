public with sharing class GeminiService {

    public static String askGemini(String prompt) {

        // Read API Key from Custom Metadata
        Gemini_Config__mdt config = Gemini_Config__mdt.getInstance('Default');

        String apiKey = config.API_Key__c;

        Http http = new Http();
        HttpRequest req = new HttpRequest();

        req.setEndpoint(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key='
            + EncodingUtil.urlEncode(apiKey, 'UTF-8')
        );

        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');

        String body = JSON.serialize(new Map<String, Object>{
            'contents' => new List<Object>{
                new Map<String, Object>{
                    'parts' => new List<Object>{
                        new Map<String, Object>{
                            'text' => prompt
                        }
                    }
                }
            }
        });

        req.setBody(body);

        HttpResponse res = http.send(req);

        return res.getBody();
    }
}