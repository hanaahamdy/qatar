
class CalculatorModel {


  double getColumnsNumber(double buildingArea){
    return buildingArea/12.0;
  }


  BaseCalc getSemils(double buildingArea){
    double columns= getColumnsNumber(buildingArea);

    double ironQunatity = buildingArea * 4.0 * 1.1;
    double selk = ironQunatity * 4;
    double zalat = (buildingArea/9) * 0.80;
    double raml = (buildingArea/9) * 0.40;
    double asmant = (buildingArea/9) * 0.35;

    return BaseCalc(
      ironQuantity: ironQunatity,
      selk: selk,
      asmant: asmant,
      zalat: zalat,
      raml: raml.roundToDouble()
    );
  }

  BaseCalc getAameda(double buildingArea){

    double ironQunatity = buildingArea /240.0;
    double selk = ironQunatity * 4;
    double zalat = (buildingArea/25);
    double raml = (buildingArea/50);
    double asmant = (buildingArea/60);

    return BaseCalc(
        ironQuantity: ironQunatity,
        selk: selk,
        asmant: asmant,
        zalat: zalat,
        raml: raml
    );
  }

  BaseCalc solid_slap(double buildingArea){

    double ironQunatity = buildingArea * 13.0;
    double selk = ironQunatity * 4;
    double zalat = (buildingArea * 0.15 * 1.30 * 0.80);
    double raml = (buildingArea * 0.15 * 1.30 * 0.40);
    double asmant = (buildingArea * 0.15 * 1.30 * 0.35);

    return BaseCalc(
        ironQuantity: ironQunatity,
        selk: selk,
        asmant: asmant,
        zalat: zalat,
        raml: raml
    );
  }


  BaseCalc flat_slap(double buildingArea){

    double ironQunatity = buildingArea /60;
    double selk = ironQunatity * 4;
    double zalat = (buildingArea * 0.2 * 1.10 * 0.80);
    double raml = (buildingArea * 0.2 * 1.10 * 0.40);
    double asmant = (buildingArea * 0.2 * 1.10 * 0.35);

    return BaseCalc(
        ironQuantity: ironQunatity,
        selk: selk,
        asmant: asmant,
        zalat: zalat,
        raml: raml
    );
  }

  BaseCalc basisc(double buildingArea){

    double ironQunatity = buildingArea /120;
    double selk = ironQunatity * 4;
    double zalat = (buildingArea / 5.0);
    double raml = (buildingArea / 10.0);
    double asmant = (buildingArea /13.0);

    return BaseCalc(
        ironQuantity: ironQunatity,
        selk: selk,
        asmant: asmant,
        zalat: zalat,
        raml: raml
    );
  }
}

class BaseCalc{
  double? ironQuantity;
  double? selk;
  double? zalat;
  double? raml;
  double? asmant;

  BaseCalc({this.selk, this.ironQuantity, this.asmant, this.raml, this.zalat});
}