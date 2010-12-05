package api.flash.setFlashVars
{
	import api.events.flash.setFlashVars.SetFlashVarsEvent;

	import api.flash.Flash;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>vars</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_VARS
	*/
	[Event(name="missingFlashVars" , type="api.events.SWFStudioEvent")]
	[Event(name="missingVars", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Set the FlashVars property for any movies loaded after this call.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_setFlashVars.html Northcode Help Documentation
	*/
	public class SetFlashVars extends Flash
	{
		// Required
		/**
		* A URL encoded string containing the variables to be set as the FlashVars.
		*
		* @defaultValue <code>null</code>
		*/
		public var vars:String = null;
		
		/**
		* Constructor for Flash.SetFlashVars()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_setFlashVars.html Northcode Help Documentation
		*/
		public function SetFlashVars(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the FlashVars property for any movies loaded after this call.
		*
		*
		* @param flashVars
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_setFlashVars.html Northcode Help Documentation
		*/
		public function setFlashVars( flashVars:String = null ):void
		{
			vars = compareStrings( flashVars , vars );
			
			switch( vars )
			{
				case null:
					missingVars();
					break;
				default:
					ssCore.Flash.setFlashVars( {vars:vars}
											  ,{callback:actionComplete, errorSTR:"setFlashVarsError", code:"21005"} );					
			}
		}
	}
}