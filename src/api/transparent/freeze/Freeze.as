package api.transparent.freeze
{
	import api.events.transparent.freeze.FreezeEvent;

	import api.transparent.Transparent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_freeze.html Northcode Help Documentation
	*/
	public class Freeze extends Transparent
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Transparent.Freeze()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_freeze.html Northcode Help Documentation
		*/
		public function Freeze(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_freeze.html Northcode Help Documentation
		*/
		public function freeze():void
		{
			ssCore.Transparent.freeze( {flag:flag}
									  ,{callback:actionComplete, errorSTR:"freezeError", code:"42002"} );
		}
	}
}