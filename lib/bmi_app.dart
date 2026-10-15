import 'package:flutter/material.dart';

class BmiApp extends StatefulWidget {
  const BmiApp({super.key});

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  double bmi=0;
  TextEditingController height=TextEditingController();
  TextEditingController wight=TextEditingController();
  TextEditingController gender=TextEditingController();
  TextEditingController age=TextEditingController();
  double meter=0;
  String selectedgender="";
 String selectedage="";
 String bmiStatus="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar: AppBar(
        backgroundColor:Colors.black,
        title:Center(
          child: Text("{ BMI Calculator }",
            style:TextStyle(fontSize:23,fontWeight:FontWeight.bold,
                color:Colors.white),),
        ),
      ),
      body:Column(
        children: [
          Row(
            children: [
              Container(
                  height: 130,
                  width:135,
                  margin:EdgeInsets.all(13),
                  padding:EdgeInsets.all(16),
                  decoration:BoxDecoration(
                    color:Colors.blue,
                    borderRadius:BorderRadius.circular(12),
                    border:Border.all(color:Colors.white,width: 2),
                    boxShadow: [
                      BoxShadow(
                          color:Colors.grey.withOpacity(0.5),
                          blurRadius:5,offset:const Offset(2, 2)
                      )
                    ],
                  ),
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text("Gender:",style:TextStyle(fontSize:13,),),
                      Text("$selectedgender",style:TextStyle(fontSize:17,fontWeight:FontWeight.bold),),
                      Text("Age:",style:TextStyle(fontSize:13,),),
                      Text("$selectedage",style:TextStyle(fontSize:17,fontWeight:FontWeight.bold),),
                    ],
                  ),
              ),
              Container(
                height: 130,
                width:135,
                margin:EdgeInsets.all(13),
                padding:EdgeInsets.all(16),
                decoration:BoxDecoration(
                  color:Colors.blue,
                  borderRadius:BorderRadius.circular(12),
                  border:Border.all(color:Colors.white,width: 2),
                  boxShadow: [
                    BoxShadow(
                        color:Colors.grey.withOpacity(0.5),
                        blurRadius:5,offset:const Offset(2, 2)
                    )
                  ],
                ),
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text("BMI:",style:TextStyle(fontSize:13,),),
                    Text(bmi==0?"-":bmi.toStringAsFixed(1),style:TextStyle(fontSize:17,fontWeight:FontWeight.bold),),
                    Icon(Icons.monitor_weight,size:50,color:Colors.white,),
                  ],
                ),
              ),
              Container(
                height: 130,
                width:135,
                margin:EdgeInsets.all(13),
                padding:EdgeInsets.all(16),
                decoration:BoxDecoration(
                  color:Colors.blue,
                  borderRadius:BorderRadius.circular(12),
                  border:Border.all(color:Colors.white,width: 2),
                  boxShadow: [
                    BoxShadow(
                        color:Colors.grey.withOpacity(0.5),
                        blurRadius:5,offset:const Offset(2, 2)
                    )
                  ],
                ),
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text("Status:",style:TextStyle(fontSize:13,),),
                    Text("$bmiStatus",style:TextStyle(fontSize:17,fontWeight:FontWeight.bold,),),
                    Icon(Icons.line_weight_sharp,size:50,color:Colors.white,),
                  ],

                ),
              ),
            ],
          ),
          SizedBox(height:10,),
          Padding(padding:EdgeInsets.all(12),child:
            TextField(
              controller: height,
              style:TextStyle(color:Colors.white),
              decoration:InputDecoration(
                hintText:'Enter Height',
                labelText:"Height",
                border:OutlineInputBorder(),
              ),
            ),),
          SizedBox(height:2,),
          Padding(padding:EdgeInsets.all(12),child:
          TextField(
            controller: wight,
            style:TextStyle(color:Colors.white),
            decoration:InputDecoration(
              hintText:'Enter Wight',
              labelText:"Wight",
              border:OutlineInputBorder(),
            ),
          ),),
          SizedBox(height: 2,),
          Padding(padding:EdgeInsets.all(12),child:
          TextField(
            controller: age,
            style:TextStyle(color:Colors.white),
            decoration:InputDecoration(
              hintText:'Enter Age',
              labelText:"age",
              border:OutlineInputBorder(),
            ),
          ),),
          SizedBox(height:2,),
          Padding(padding:EdgeInsets.all(12),child:
          TextField(
            controller:gender,
            style:TextStyle(color:Colors.white),
            decoration:InputDecoration(
              hintText:'Enter Gender',
              labelText:"Male or Female",
              border:OutlineInputBorder(),
            ),
          ),),
          SizedBox(height: 2,),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){
                double h=double.tryParse(height.text)??0;
                double w=double.tryParse(wight.text)??0;

                if(h>0&& w>0){
                  if(h>3){
                    meter=h/100;
                  }else
                    {
                      meter=h;
                    }
                }
                String status="";
                if(bmi<=18.5){
                  status=("Underweight");
                }else if(bmi<=24.9){
                  status=("Normal");
                }else if(bmi<=29){
                  status=("Overweight");
                }else{
                  status=("Obese");
                }
                setState(() {
                  bmi=w/(meter*meter);
                  selectedgender=gender.text;
                  selectedage=age.text;
                  bmiStatus=status;


                });
              }, child:Text("Calculate",style:TextStyle(fontSize:12,fontWeight:FontWeight.bold,color:Colors.purple),)),
              ElevatedButton(onPressed:(){
                setState(() {
                  selectedage="";
                  selectedgender="";
                  bmiStatus="";
                  bmi=0;

                });
              } , child: Text("Clear",style:TextStyle(fontSize:12,fontWeight:FontWeight.bold,color:Colors.purple),)),
            ],
          )
        ],
      )

    );
  }
}
