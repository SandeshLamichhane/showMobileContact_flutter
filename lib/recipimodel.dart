class RecipiModel{
 
 late String label;
 late String imageUrl;

 RecipiModel({

  required  this.label,
  required  this.imageUrl

 });

 //let have static list to show
//https://drive.google.com/uc?export=view&id=1vyF4aQrirOipd4_DMAshBuguSnwTBha4
//https://drive.google.com/uc?export=view&id=1qduLhvbe2L3aJD6ffM07snTPht5cA3Pl

//https://drive.google.com/uc?export=view&id=1GM0o6H4TePB3xFLDjI4RhKGxC-rEsM-4
 static List<RecipiModel> listofRecipiModel =[

   RecipiModel(  label:  "tomato",
     imageUrl:  "https://drive.google.com/uc?export=view&id=1vyF4aQrirOipd4_DMAshBuguSnwTBha4"),
  
   RecipiModel(  label:  "Mango",
     imageUrl:  "https://drive.google.com/uc?export=view&id=1qduLhvbe2L3aJD6ffM07snTPht5cA3Pl"),

      RecipiModel(  label:  "chowmin soup",
     imageUrl:  "//https://drive.google.com/uc?export=view&id=1GM0o6H4TePB3xFLDjI4RhKGxC-rEsM-4")

 ];

}