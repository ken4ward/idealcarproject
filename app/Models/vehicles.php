<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class vehicles extends Model
{
    use HasFactory;
    use Userstamps;
    public $table = "vehicles";

    public function vehicles()
    {
       return $this->belongsTo(branch::class);
    }
    public function trips()
    {
      return $this->hasMany(trips::class, 'vehicle_id');
    }
    public function vehicle_locations()
    {
      return $this->hasMany(vehicle_locations::class, 'vehicle_id');
    }
    public function maintenance_schedule()
    {
         return $this->hasMany(maintenance_schedule::class, 'vehicle_id');
    }
    public function maintenance_records()
        {
             return $this->hasMany(maintenance_records::class, 'vehicle_id');
        }

    public function rental_options()
    {
        return $this->belongsToMany(rental_options::class);
    }
}
