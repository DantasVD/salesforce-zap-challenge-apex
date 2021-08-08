public with sharing class ViacepModel {
    public String cep;
    public String logradouro;
    public String complemento;
    public String bairro;
    public String localidade;
    public String uf;
    public String ibge;
    public String gia;
    public String ddd;
    public String siafi;
    public String erro;
    
    public static ViaCepModel parse(String json) {
        return (ViaCepModel) System.JSON.deserialize(json, ViaCepModel.class);
    }
    
}