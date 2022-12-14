import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateContenidoExtraDto } from './dto/create-contenido-extra.dto';
import { PrismaService } from 'src/prisma.service';
import { contenido_extra, Prisma } from '@prisma/client';

@Injectable()
export class ContenidoExtraService {
  constructor(private prisma: PrismaService) {}

  async contenidoExtra(contenidoExtraWhereUniqueInput: Prisma.contenido_extraWhereUniqueInput): Promise<contenido_extra | null> {
    return this.prisma.contenido_extra.findUnique({
      where: contenidoExtraWhereUniqueInput,
    });
  }

  async contenidoExtras(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.contenido_extraWhereUniqueInput;
    where?: Prisma.contenido_extraWhereInput;
  }): Promise<contenido_extra[]> {
    const { skip, take, cursor, where } = params;
    return this.prisma.contenido_extra.findMany({
      skip,
      take,
      cursor,
      where,
    });
  }

  async newContenidoExtra(data: Prisma.contenido_extraCreateInput): Promise<contenido_extra> {
   try {
    const resultado = await this.prisma.contenido_extra.create({
      data,
    });
    if(!resultado){
      throw "No se encontro el documento";
    }
    return resultado
   } catch (error) {
    throw new HttpException({
      status: HttpStatus.NOT_FOUND,
      error: 'No se encontro el video',
    }, HttpStatus.NOT_FOUND, {
      cause: error
    });
   }
  }

  async deleteContenidoExtra(where: Prisma.contenido_extraWhereUniqueInput): Promise<contenido_extra> {
    return this.prisma.contenido_extra.delete({
      where,
    });
  }
}
