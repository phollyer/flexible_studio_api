package api.browser.setGuides
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class SetGuides extends Browser
	{
		// Required
		public var bottomGuide:String = null;
		public var leftGuide:String = null;
		public var rightGuide:String = null;
		public var topGuide:String = null;
		
		// Optional
		public var bottomMargin:Number = 0;
		public var leftMargin:Number = 0;
		public var rightMargin:Number = 0;
		public var topMargin:Number = 0;
		
		public function SetGuides(target:IEventDispatcher=null)
		{
			super(target);
		}
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