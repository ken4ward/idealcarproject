<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

use App\Models\trips;
use App\Models\payments;

class invoices extends Model
{
    use HasFactory;
    use Userstamps;
    public $table = "invoices";

    public function trips()
    {
        return $this->belongsTo(trips::class);
    }
    public function payment()
    {
        return $this->hasOne(payments::class, 'invoice_id');
    }
}
