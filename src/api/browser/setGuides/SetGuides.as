package api.browser.setGuides
{
	import api.browser.Browser;

	import api.events.browser.setGuides.SetGuidesEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setGuides.html Northcode Help Documentation
	*/
	public class SetGuides extends Browser
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var bottomGuide:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var leftGuide:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var rightGuide:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var topGuide:String = null;
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var bottomMargin:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var leftMargin:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var rightMargin:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var topMargin:Number = 0;
		
		/**
		* Constructor for Browser.SetGuides()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setGuides.html Northcode Help Documentation
		*/
		public function SetGuides(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setGuides.html Northcode Help Documentation
		*/
		public function setGuides():void
		{
			ssCore.Browser.setGuides( {bottomGuide:bottomGuide
									  ,leftGuide:leftGuide
									  ,rightGuide:rightGuide
									  ,topGuide:topGuide
									  ,bottomMargin:bottomMargin
									  ,leftMargin:leftMargin
									  ,rightMargin:rightMargin
									  ,topMargin:topMargin} , {callback:actionComplete, errorSTR:"setGuidesError", code:"10026"} );
		}
	}
}