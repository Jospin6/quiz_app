
void main(List<String> args){

  const info = {
    "name": "jospin",
    "age": 23
  };

  for (var entry in info.entries) {
    print("${entry.key}: ${entry.value}");
  }



}

void generic<T>(T val){
    switch (T) {
      case int:
        print("this is an integer");
        break;
      case String:
        print("this a string");
        break;
      default:
        print("this an other type");
        break;
    }
  }