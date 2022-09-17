import { Component, OnInit } from '@angular/core';
import { Car, CarPreview } from '../car';
import { CarService } from '../car.service';
import { MessagesService } from '../messages.service';


@Component({
  selector: 'app-cars',
  templateUrl: './cars.component.html',
  styleUrls: ['./cars.component.css']
})
export class CarsComponent implements OnInit {


  selectedCar?: Car;
  cars: Car[] = [];
  carsPreview: CarPreview[] = [];
  //cars?: CarsRaw["data"];


  constructor(private carService: CarService, private messagesService: MessagesService) { }

  ngOnInit(): void {
    this.getCars();

  }

  onSelect(vehicleid: number): void {
    //console.log(vehicleid)
    this.getCar(vehicleid);
    this.messagesService.add('CarsComponent: Selected car id=' + vehicleid);
  }

  getCars(): void {
    this.carService.getCars()
      .subscribe(cars => this.cars = cars.data)
  }

  getCarsPreview(): void {
    this.carService.getCarsPreview()
      .subscribe(cars => this.carsPreview = cars.data)
  }

  getCar(vehicleid: number): void {
    //console.log(vehicleid);
    this.carService.getCar(vehicleid)
      .subscribe(carRaw => this.selectedCar = carRaw.data)
  }

}
