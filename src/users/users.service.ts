import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CredentialsDTO } from 'src/auth/dtos/credentials.dto';
import { Repository } from 'typeorm';
import { User } from './entities/user.entity';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>
  ) {}

  async create(credentials: CredentialsDTO) {
    return await this.usersRepository.create({ ...credentials }).save();
  }

  async findByEmail(email: string) {
    return await this.usersRepository.findOneOrFail({ where: { email } });
  }
}
