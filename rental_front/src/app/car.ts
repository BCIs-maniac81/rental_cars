export interface Car {
  vehicleid: number;
  name: string;
  brand: string;
  air_cond: string;
  heating: string;
  fuel: string;
  category: string;
}
export interface CarPreview {
  vehicleid: number;
  name: string;
  brand: string;
}

export interface CarRaw {
  data: Car;
  message: string;
}

export interface CarsRaw {
  data: Car[];
  message: string;
}

export interface CarsPreviewRaw {
  data: CarPreview[];
  message: string;
}