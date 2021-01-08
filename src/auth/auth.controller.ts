import { Controller, Post, UseGuards, Request, Body } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { AuthService } from './auth.service';
import { CredentialsDTO } from './dtos/credentials.dto';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('register')
  async register(@Body() credentials: CredentialsDTO) {
    return await this.authService.register(credentials);
  }

  @Post('login')
  @UseGuards(AuthGuard('local'))
  async login(@Request() req): Promise<any> {
    return req.user;
  }
}
