class FormUtils {
  static String getValueBasedOnFieldName(final key, String name) {
    return key.currentState?.fields[name]?.value;
  }
}
