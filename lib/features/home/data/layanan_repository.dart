/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:sibiru_dev/features/home/data/layanan_data.dart';
import 'package:sibiru_dev/features/home/models/layanan_model.dart';

class LayananRepository {
  List<Layanan> getLayanan() {
    return LayananData.list;
  }
}
