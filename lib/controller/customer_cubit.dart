import 'package:bloc/bloc.dart';
import 'package:code_academy_4_mvc/controller/customer_state.dart';
import 'package:code_academy_4_mvc/models/customer.dart';

class CustomerCubit extends Cubit<CustomerState>{
  List<Customer> customers = [
    Customer(name: 'Abdelrhaman', counter: 5),
    Customer(name: 'Mohamed', counter: 10),
    Customer(name: 'Ahmed'),
  ];

  CustomerCubit() : super(InitCustomerState());

  void addOne(int index){
    customers[index].counter += 1;
    emit(AddOneCustomerState());
  }

}