<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class AppFixtures extends Fixture
{
    /**
     * @var UserPasswordEncoderInterface
     */
    private $passwordEncoder;

    /**
     * @var \Faker\Factory
     */
    private $faker;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->passwordEncoder = $passwordEncoder;
        $this->faker = \Faker\Factory::create();
    }


    public function load(ObjectManager $manager)
    {
        for ($i = 1; $i <= 20; $i++){
            $user = new User();
            $user->setUsername($this->faker->userName);
            $user->setLastname($this->faker->lastName());
            $user->setFirstname($this->faker->firstname());
            $user->setEmail($this->faker->email);
            $user->setPassword($this->passwordEncoder->encodePassword(
                $user,
                $this->faker->password
            ));
            $user->setBirthdate(new \DateTime($this->faker->date('Y-m-d')));
            $user->setCity($this->faker->city);

            $manager->persist($user);
        }

        $manager->flush();
    }
}
