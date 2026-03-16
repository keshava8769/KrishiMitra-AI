class FertilizerCalculator {
  static Map<String, double> calculate(String crop, double acres) {
    double urea = 0;
    double dap = 0;
    double potash = 0;

    switch (crop) {
      case "Paddy":
        urea = acres * 50;
        dap = acres * 25;
        potash = acres * 20;
        break;

      case "Tomato":
        urea = acres * 60;
        dap = acres * 30;
        potash = acres * 25;
        break;

      case "Cotton":
        urea = acres * 45;
        dap = acres * 20;
        potash = acres * 18;
        break;

      case "Maize":
        urea = acres * 55;
        dap = acres * 28;
        potash = acres * 22;
        break;
    }

    return {
      "urea": urea,
      "dap": dap,
      "potash": potash,
    };
  }
}