import { LightningElement } from 'lwc';
import askAI from '@salesforce/apex/GeminiController.askAI';

export default class ApexIQChat extends LightningElement {

    prompt = '';
    response = '';

    handleChange(event) {
        this.prompt = event.target.value;
    }

    async askGemini() {

        try {

            this.response = 'Thinking...';

            const result = await askAI({
                prompt: this.prompt
            });

            this.response = result.message;

        } catch (error) {

            this.response =
                JSON.stringify(error);

        }

    }

}