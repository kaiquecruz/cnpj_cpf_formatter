This library helps with CNPJ and CPF formatter. Both of them are brazilian a documentation where CNPJ is a business document and CPF is a person document.

## Usage

A simple usage example:

### CPF formatter

```dart
    TextField(
        decoration: InputDecoration(
        labelText: 'CPF',
        helperText: 'just CPF formatting',
        ),
        inputFormatters: [
        CnpjCpfFormatter(
            eDocumentType: EDocumentType.CPF,
        )
        ],
    )
```

### CNPJ formatter

```dart
    TextField(
        decoration: InputDecoration(
        labelText: 'CNPJ',
        helperText: 'just CNPJ formatting',
        ),
        inputFormatters: [
        CnpjCpfFormatter(
            eDocumentType: EDocumentType.CNPJ,
        )
        ],
    )
```

### CNPJ and CPF formatters in same field

```dart
    TextField(
        decoration: InputDecoration(
        labelText: 'CNPJ/CPF',
        helperText: 'CNPJ and CPF formatting',
        ),
        inputFormatters: [
        CnpjCpfFormatter(
            eDocumentType: EDocumentType.BOTH,
        )
        ],
    )
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/evandrofuhr/cnpj_cpf_formatter/issues
