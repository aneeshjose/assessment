import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_sheet_cubit_state.dart';

class BottomSheetCubitCubit extends Cubit<BottomSheetCubitState> {
  BottomSheetCubitCubit() : super(BottomSheetCubitInitial());

  void addBottomButtons() {
    emit(AddBottomSheet());
  }

  void removeBottomButtons() {
    emit(RemoveBottomSheet());
  }
}
