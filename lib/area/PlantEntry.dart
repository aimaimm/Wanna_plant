class PlantEntry {
  final String name;
  final String price;
  final String _val;
  final String size_area;
  final String description;
  

  PlantEntry(this.name, this.price, this._val, this.size_area, this.description,
      );
  @override
  String toString() {
    return 'Kind of Plant: name= $name, price= $price, val = $_val,size = $size_area,description = $description';
  }
}
