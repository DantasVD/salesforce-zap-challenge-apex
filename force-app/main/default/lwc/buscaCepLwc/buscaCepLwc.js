import { LightningElement, track, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import doCallout from '@salesforce/apex/BuscaCepController.doCallout';
import saveData from '@salesforce/apex/BuscaCepController.saveData';

export default class buscaCepLwc extends LightningElement {
    @api recordId;
    @track isModalOpen = false;
    @track isEnterCep = false;
    @track isSubmit = false;
    @track viacepModel = {};

    @track buscaCEP;

    changeBusca(event)
    {
        this.buscaCEP = event.target.value;
        console.log('changeBusca2: ', this.buscaCEP);
    }
    openModal()
    {
        this.isModalOpen = true;
        this.isEnterCep = true;
    }
    
    closeModal()
    {
        
        this.isModalOpen = false;
    }

    submitDetails()
    {
        
        this.isModalOpen = false;
    }

    consultaCep()
    {
        console.log("ConsultaCEP12312345");
        console.log(this.buscaCEP);
        let valid = !/\D/.test(this.buscaCEP) && this.buscaCEP.length == 8;
        console.log('Is valid? ', valid);
        if(valid === true)
        {
            this.isSubmit = true;
            this.getAddress();
            this.isEnterCep = false;
        }
        else
        {
            this.showToastEvent('CEP inválido', 'Por favor insira CEP apenas números!', 'error')
        }
    }

    saveOnAccount()
    {
        
        console.log("saveOnAccount");
        saveData({ 
                    viacepModelData: JSON.stringify(this.viacepModel),
                    recordId: this.recordId
                })
            .then(result => {
                this.showToastEvent('Sucesso!', 'Dados armazenados com sucesso', 'success')

            })
            .catch((error) => {
                this.showToastEvent('error!', 'Houve um erro ao armazenar os dados entre em contato com um administrador.', 'erro')
            })
            .finally(() => {
                console.log('Finally:', this.isModalOpen); // Finally
            });
            this.isModalOpen = false;
    }

    showToastEvent(title, message, variant)
    {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(evt);
    }

    getAddress()
    {
        console.log("getAddress string new");
        doCallout({ cepBusca: this.buscaCEP })
            .then(result => {
                console.log('string parse: ', JSON.parse(result));
                let jsonresult = JSON.parse(result);
                this.viacepModel = jsonresult.viacepModel;
                console.log('data@@: ', result);
                
                console.log('data**: ', result.viacepModel);

            })
            .catch((error) => {
                console.log(error)
            });
    }
}