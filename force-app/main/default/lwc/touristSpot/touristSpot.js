import { LightningElement } from 'lwc';

export default class TouristSpot extends LightningElement {
    activeSections = ['1', '2'];
    activeSectionsMessage = '';

    handleSectionToggle(event) {
        const openSections = event.detail.openSections;

        if (openSections.length === 0) {
            this.activeSectionsMessage = 'Open a section to know about tourist places in California';
        } else {
            this.activeSectionsMessage =
                'Tourist Spot: ' + openSections.join(', ');
        }
    }
}