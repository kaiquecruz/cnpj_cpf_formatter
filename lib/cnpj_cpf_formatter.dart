import 'package:cnpj_cpf_helper/cnpj_cpf_helper.dart';
import 'package:flutter/services.dart';

enum EDocumentType {
  BOTH,
  CNPJ,
  CPF,
}

/// This formatter gets the user input and puts de mask by
/// the document type.
///
/// [eDocumentType]: Choose the document type to formatting
class CnpjCpfFormatter extends TextInputFormatter {
  final EDocumentType eDocumentType;

  CnpjCpfFormatter({
    this.eDocumentType = EDocumentType.BOTH,
  });
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var _workingValue = CnpjCpfBase.onlyNumbers(newValue.text);
    if (eDocumentType == EDocumentType.CPF ||
        (eDocumentType == EDocumentType.BOTH && _workingValue.length <= 11)) {
      _workingValue = CnpjCpfBase.maskCpf(newValue.text);
    } else if (eDocumentType == EDocumentType.CNPJ ||
        (eDocumentType == EDocumentType.BOTH && _workingValue.length > 11)) {
      _workingValue = CnpjCpfBase.maskCnpj(newValue.text);
    }

    // if the string ends with a non-number (mask digit, for example)
    // it's not possible to remove from textfield using backspace
    // for this reason we need to cut off this from string
    var _regExp = RegExp(
      '^[0-9./-]{0,}[^0-9]{1,1}\$',
    );
    if (_regExp.hasMatch(_workingValue)) {
      _workingValue = _workingValue.substring(0, _workingValue.length - 1);
    }

    var _selection = newValue.selection.baseOffset;
    if (oldValue.selection.baseOffset > newValue.selection.baseOffset) {
      if (newValue.selection.baseOffset > _workingValue.length) {
        _selection = _workingValue.length;
      }
    } else {
      _regExp = RegExp(
        '^[0-9./-]{0,}[./-]{1,1}[0-9]{1,1}\$',
      );
      if (_regExp.hasMatch(_workingValue)) {
        _selection++;
      }
      if (_selection > _workingValue.length) {
        _selection = _workingValue.length;
      }
    }
    return TextEditingValue(
      text: _workingValue,
      composing: TextRange(
        start: -1,
        end: -1,
      ),
      selection: TextSelection(
        baseOffset: _selection,
        extentOffset: _selection,
      ),
    );
  }
}
