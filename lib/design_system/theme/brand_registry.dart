import 'brand.dart';
import 'brand_palette.dart';
import 'palettes/prod_palette.dart';

const Map<Brand, BrandPalette> _brands = {Brand.prod: prodBrand};

BrandPalette paletteFor(Brand brand) => _brands[brand]!;
