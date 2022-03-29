import axios, { AxiosPromise } from 'axios';
import { User } from '../models/User';

export class UserService {

  private endpoint: string;
  private entity: string;

  constructor(endpoint: string, entity: string) {
    this.endpoint = endpoint;
    this.entity = entity;
  }

  public getAllUsers(): AxiosPromise<{ 'users': User[] }> {
    const response = axios.get(`${this.endpoint}${this.entity}`);
    return response;
  }

  public createUser(data: User): AxiosPromise<{ 'user': User }> {
    return axios.post(`${this.endpoint}${this.entity}`, { user: data });
  }

  public updateUser(identifier: number, data: User): AxiosPromise<{ 'user': User }> {
    return axios.put(`${this.endpoint}${this.entity}/${identifier}`, { user: data });
  }

  public getUser(identifier: number): AxiosPromise<{ 'product': User }> {
    return axios.get(`${this.endpoint}${this.entity}/${identifier}`);
  }

  public deleteUser(identifier: number): AxiosPromise<any> {
    return axios.delete(`${this.endpoint}${this.entity}/${identifier}`);
  }

}