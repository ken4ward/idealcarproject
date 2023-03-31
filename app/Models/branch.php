<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class branch extends Model
{
    use HasFactory;
    use Userstamps;
    public $table = "branch";

    public function branches()
    {
       return $this->belongsTo(country::class);
    }

     public function users()
     {
         return $this->belongsToMany(user::class);
     }
     public function vehicles()
     {
         return $this->hasMany(vehicles::class);
     }
     public function fuel_cards()
     {
          return $this->hasMany(fuel_cards::class);
     }
     public function branch_card_to_user()
     {
         return $this->hasMany(branch_card_to_user::class, 'branch_id');
     }

     public function rental_options()
     {
         return $this->belongsToMany(rental_options::class);
     }
}
