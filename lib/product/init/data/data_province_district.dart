import 'package:pikseltesisat/product/models/customer/district.dart';
import 'package:pikseltesisat/product/models/customer/province.dart';

final class DataProvinceDistrict {
  const DataProvinceDistrict._();

  static const districts = [
    District(id: 1103, provinceId: 34, name: 'ADALAR'),
    District(id: 2048, provinceId: 34, name: 'ARNAVUTKÖY'),
    District(id: 2049, provinceId: 34, name: 'ATAŞEHİR'),
    District(id: 2003, provinceId: 34, name: 'AVCILAR'),
    District(id: 2004, provinceId: 34, name: 'BAĞCILAR'),
    District(id: 2005, provinceId: 34, name: 'BAHÇELİEVLER'),
    District(id: 1166, provinceId: 34, name: 'BAKIRKÖY'),
    District(id: 2050, provinceId: 34, name: 'BAŞAKŞEHİR'),
    District(id: 1886, provinceId: 34, name: 'BAYRAMPAŞA'),
    District(id: 1183, provinceId: 34, name: 'BEŞİKTAŞ'),
    District(id: 1185, provinceId: 34, name: 'BEYKOZ'),
    District(id: 2051, provinceId: 34, name: 'BEYLİKDÜZÜ'),
    District(id: 1186, provinceId: 34, name: 'BEYOĞLU'),
    District(id: 1782, provinceId: 34, name: 'BÜYÜKÇEKMECE'),
    District(id: 1237, provinceId: 34, name: 'ÇATALCA'),
    District(id: 2052, provinceId: 34, name: 'ÇEKMEKÖY'),
    District(id: 2016, provinceId: 34, name: 'ESENLER'),
    District(id: 2053, provinceId: 34, name: 'ESENYURT'),
    District(id: 1325, provinceId: 34, name: 'EYÜPSULTAN'),
    District(id: 1327, provinceId: 34, name: 'FATİH'),
    District(id: 1336, provinceId: 34, name: 'GAZİOSMANPAŞA'),
    District(id: 2010, provinceId: 34, name: 'GÜNGÖREN'),
    District(id: 1421, provinceId: 34, name: 'KADIKÖY'),
    District(id: 1810, provinceId: 34, name: 'KAĞITHANE'),
    District(id: 1449, provinceId: 34, name: 'KARTAL'),
    District(id: 1823, provinceId: 34, name: 'KÜÇÜKÇEKMECE'),
    District(id: 2012, provinceId: 34, name: 'MALTEPE'),
    District(id: 1835, provinceId: 34, name: 'PENDİK'),
    District(id: 2054, provinceId: 34, name: 'SANCAKTEPE'),
    District(id: 1604, provinceId: 34, name: 'SARIYER'),
    District(id: 1659, provinceId: 34, name: 'ŞİLE'),
    District(id: 1622, provinceId: 34, name: 'SİLİVRİ'),
    District(id: 1663, provinceId: 34, name: 'ŞİŞLİ'),
    District(id: 2014, provinceId: 34, name: 'SULTANBEYLİ'),
    District(id: 2055, provinceId: 34, name: 'SULTANGAZİ'),
    District(id: 2015, provinceId: 34, name: 'TUZLA'),
    District(id: 1852, provinceId: 34, name: 'ÜMRANİYE'),
    District(id: 1708, provinceId: 34, name: 'ÜSKÜDAR'),
    District(id: 1739, provinceId: 34, name: 'ZEYTİNBURNU'),
  ];

  static final List<Province> provinces = [
    Province(
        id: 34,
        name: 'İstanbul',
        districts:
            districts.where((element) => element.provinceId == 34).toList()),
  ];
}
