#!bin/bash

echo "Script de criação de estrutura de usuários, diretórios e permissões"

echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Os diretórios /publico, /adm, /ven e /sec foram criados com sucesso!"

echo "Criando grupos..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Os grupos GRP_ADM, GRP_VEN e GRP_SEC foram criados com sucesso!"

echo "Criando uuários e adicionando ao seu grupo..."

useradd carlos -c "Carlos" -m -s /bin/bash -p $(openssl passwd Adm123) -G GRP_ADM
useradd maria -c "Maria" -m -s /bin/bash -p $(openssl passwd Adm123) -G GRP_ADM
useradd joao_ -c "João" -m -s /bin/bash -p $(openssl passwd Adm123) -G GRP_ADM

echo "Usuários carlos, maria e joao_ criados e adicionados ao GRP_ADM!"

useradd debora -c "Debora" -m -s /bin/bash -p $(openssl passwd Ven123) -G GRP_VEN
useradd sebastiana -c "Sebastiana" -m -s /bin/bash -p $(openssl passwd Ven123) -G GRP_VEN
useradd roberto -c "Roberto" -m -s /bin/bash -p $(openssl passwd Ven123) -G GRP_VEN

echo "Usuários debora, sebastiana e roberto criados e adicionados ao GRP_VEN!"

useradd josefina -c "Josefina" -m -s /bin/bash -p $(openssl passwd Sec123) -G GRP_SEC
useradd amanda -c "Amanda" -m -s /bin/bash -p $(openssl passwd Sec123) -G GRP_SEC
useradd rogerio -c "Rogério" -m -s /bin/bash -p $(openssl passwd Sec123) -G GRP_SEC

echo "Usuários josefina, amanda, rogerio, criados e adicionados ao GRP_SEC!"

echo "Adicionando grupos no diretório especifico..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "root foi definido como DONO dos diretórios"

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Tudo feito!"
