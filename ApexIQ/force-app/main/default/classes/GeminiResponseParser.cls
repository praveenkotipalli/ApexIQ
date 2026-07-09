public with sharing class GeminiResponseParser {

    public static AIResponse parse(String jsonResponse) {

        AIResponse response = new AIResponse();

        try {

            Map<String, Object> data =
                (Map<String, Object>) JSON.deserializeUntyped(jsonResponse);

            List<Object> candidates =
                (List<Object>) data.get('candidates');

            if (candidates != null && !candidates.isEmpty()) {

                Map<String, Object> candidate =
                    (Map<String, Object>) candidates[0];

                Map<String, Object> content =
                    (Map<String, Object>) candidate.get('content');

                List<Object> parts =
                    (List<Object>) content.get('parts');

                Map<String, Object> part =
                    (Map<String, Object>) parts[0];

                response.success = true;
                response.message = (String) part.get('text');
                response.provider = 'Gemini';

            } else {

                response.success = false;
                response.message = 'No response received from Gemini.';
                response.provider = 'Gemini';

            }

        } catch (Exception e) {

            response.success = false;
            response.message = e.getMessage();
            response.provider = 'Gemini';

        }

        return response;

    }

}