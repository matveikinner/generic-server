import { Injectable } from '@nestjs/common';
import { UsersService } from 'src/users/users.service';
import { CredentialsDTO } from './dtos/credentials.dto';

@Injectable()
export class AuthService {
  constructor(private usersService: UsersService) {}

  async register(credentials: CredentialsDTO) {
    return await this.usersService.create(credentials);
  }

  async validate(email: string, password: string) {
    const user = await this.usersService.findByEmail(email);
    if (user && (await user.comparePassword(password))) {
      return user;
    }
    return null;
  }
}
