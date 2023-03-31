<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class trips extends Model
{
    use HasFactory;
    use Userstamps;
    public $table = "trips";

    public function trips()
    {
      return $this->belongsTo(vehicles::class);
    }

    public function routes()
    {
       return $this->hasMany(routes::class, 'trip_id');
    }

    public function invoices()
    {
       return $this->hasMany(invoices::class, 'trip_id');
    }
}
