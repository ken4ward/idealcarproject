<?php

namespace App\Http\Controllers;

use App\Http\Requests\Storemaintenance_scheduleRequest;
use App\Http\Requests\Updatemaintenance_scheduleRequest;
use App\Models\maintenance_schedule;

class MaintenanceScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Storemaintenance_scheduleRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(maintenance_schedule $maintenance_schedule)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(maintenance_schedule $maintenance_schedule)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Updatemaintenance_scheduleRequest $request, maintenance_schedule $maintenance_schedule)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(maintenance_schedule $maintenance_schedule)
    {
        //
    }
}
