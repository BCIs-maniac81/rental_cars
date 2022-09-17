import { Injectable } from '@angular/core';
import { CarRaw, CarsPreviewRaw, CarsRaw } from './car';
//import { CARS } from './mock-cars';
import { Observable, of } from 'rxjs';
import { MessagesService } from './messages.service';
import { HttpClient, HttpHeaders } from '@angular/common/http';
//import { catchError, map, tap } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class CarService {

  private baseUrl = 'http://localhost:5000';
  private carsUrl = this.baseUrl + '/rental/all' //@TODO
  private carsPreviewUrl = this.baseUrl + '/rental/preview' //@TODO
  private carUrl = this.baseUrl + '/rental/'


  constructor(private messagesService: MessagesService, private http: HttpClient) { }

  private log(message: string) {
    this.messagesService.add(`HeroService: ${message}`)
  }

  getCars(): Observable<CarsRaw> {
    this.messagesService.add('CarService: fetched cars');
    return this.http.get<CarsRaw>(`${this.carsUrl}`);
  }

  getCarsPreview(): Observable<CarsPreviewRaw> {
    return this.http.get<CarsPreviewRaw>(`${this.carsPreviewUrl}`)
  }

  // getCar(vehicleId: String): Observable<Car> {
  //   return this.http.get<Car>(`${this.carUrl}` + vehicleId)
  // }
  getCar(vehicleId: number): Observable<CarRaw> {
    //console.log(vehicleId);
    return this.http.get<CarRaw>(`${this.carUrl}` + vehicleId)
  }
}
