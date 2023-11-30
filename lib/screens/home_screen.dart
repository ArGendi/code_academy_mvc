import 'package:code_academy_4_mvc/controller/customer_cubit.dart';
import 'package:code_academy_4_mvc/controller/customer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        // builder to rebuild UI if any change happen in customer cubit
        child: BlocBuilder<CustomerCubit, CustomerState>(
          builder: (context, state) {
            // listview to show all list of customers inside cubit
            return ListView.separated(
              itemBuilder: (context, i){
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        Text('${BlocProvider.of<CustomerCubit>(context).customers[i].name}'),
                        SizedBox(width: 10,),
                        Text('${BlocProvider.of<CustomerCubit>(context).customers[i].counter}'),
                        Spacer(),
                        IconButton(
                          onPressed: (){
                            // take customer index from listview to +1 to it's counter
                            BlocProvider.of<CustomerCubit>(context).addOne(i);
                          }, 
                          icon: Icon(Icons.add_box),
                        ),
                      ],
                    ),
                  ),
                );
              }, 
              separatorBuilder: (context, i){
                return const SizedBox(height: 10,);
              }, 
              itemCount: BlocProvider.of<CustomerCubit>(context).customers.length,
            );
          }
        ),
      ),
    );
  }
}