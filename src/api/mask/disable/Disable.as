package api.mask.disable
{
	import api.events.mask.disable.DisableEvent;

	import api.mask.Mask;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mask_disable.html Northcode Help Documentation
	*/
	public class Disable extends Mask
	{
		/**
		* Constructor for Mask.Disable()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mask_disable.html Northcode Help Documentation
		*/
		public function Disable(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mask_disable.html Northcode Help Documentation
		*/
		public function disable():void
		{
			ssCore.Mask.disable( {}
								,{callback:actionComplete, errorSTR:"disableError", code:"27000"} );
		}
	}
}